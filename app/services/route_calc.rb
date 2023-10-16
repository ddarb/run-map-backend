class RouteCalc
    include ActiveModel::Model       # make it a model
    include ActiveModel::Validations # add validations

    attr_accessor :from, :to
    validates :from, :to, presence: true
    
    # Custom validations for formatting and type
    validate :lat_long_comma_sep
    validate :lat_long_numbers
    
    def lat_long_numbers
        for param in [from, to] do
            lnglat = param.split(',')
            for num in lnglat do
                if !is_number?(num)
                    errors.add :base, "Lng or Lat param %s is not a number" % [num]
                end
            end
        end
    end

    def lat_long_comma_sep
        for param in [from, to] do
            lnglat = param.split(',')
            # TODO: specify which param is wrong
            if lnglat.length() != 2
                errors.add :base, "From and to params must be of the form from=to=`<float: lng>,<float: lat>`"
            end
        end
    end

    

    def is_number? string
        true if Float(string) rescue false
    end
    
    # Return a geojson line from a json file.
    # This will eventually be replace by a call to the graphopper API
    def perform_calc
        json_filepath = File.join(File.dirname(__FILE__), "route.json")
        data = JSON.parse(File.read(json_filepath))
    end

end