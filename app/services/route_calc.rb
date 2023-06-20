class RouteCalc
    include ActiveModel::Model       # make it a model
    include ActiveModel::Validations # add validations

    attr_accessor :from, :to

    validates :from, :to, presence: true
    # This validator is wrong, we want the from and to to be of the form from='<float>,<float>' and to = '<float>,<float>' 
    validates :from, :to, numericality: true

    # Return a geojson line from a json file.
    # This will eventually be replace by a call to the graphopper API
    def perform_calc
        json_filepath = File.join(File.dirname(__FILE__), "route.json")
        data = JSON.parse(File.read(json_filepath))
    end

end