class ResourcesController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :html
end
