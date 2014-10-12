module HasPosition
  extend ActiveSupport::Concern

  included do
    def self.has_position options = {}
      cattr_accessor :scoped_fields
      attr_accessor :positions_process

      self.scoped_fields = options[:scoped_fields]

      before_save :position_process
      after_destroy :close_ranks
      after_create :move_ranks

      default_scope { order('position ASC') }
      include HasPosition::InstanceMethods
    end

    module InstanceMethods


      def get_tail
        rel = self.class.where("position >= ?", self.position)
        scoped_fields = self.class.scoped_fields
        if !scoped_fields.nil? && scoped_fields.any?
          scoped_fields.each do |field_name|
            rel = rel.where(field_name => self.send(field_name))
          end
        end
        rel = rel.where("id <> ?", self.id) unless self.id.nil?
        rel
      end


      private

      def close_ranks
        return if self.positions_process
        puts "close_ranks"
        self.get_tail.each do |item|
          item.position -= 1
          item.positions_process = true
          item.save :validate => false
        end
      end

      def move_ranks
        return if self.positions_process
        puts "move_ranks"
        self.get_tail.each do |item|
          item.position += 1
          item.positions_process = true
          item.save :validate => false
        end
      end



      def position_process
        return if self.positions_process
        self.position = 1 if self.position.nil?

        if self.changes["position"]
          old_position = self.changes["position"][0]
          if old_position
            sign = old_position < self.position
            puts "sign #{sign}"
            min_position = [old_position, self.position].min
            max_position = [old_position, self.position].max
            rel = self.class.where("position >= ?", min_position).where("position <= ?", max_position)
            scoped_fields = self.class.scoped_fields
            if !scoped_fields.nil? && scoped_fields.any?
              scoped_fields.each do |field_name|
                rel = rel.where(field_name => self.send(field_name))
              end
            end
            rel = rel.where("id <> ?", self.id) unless self.id.nil?

            rel.each do |item|
              if sign
                item.position -= 1
              else
                item.position += 1
              end
              item.positions_process = true
              item.save :validate => false
            end
          end
        end
      end
    end
  end
end