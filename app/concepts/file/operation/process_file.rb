module File::Operation
    class ProcessFile < Trailblazer::Operation

        step :accept_file_input
        step :valid_input_file?
        step :convert_to_json
        step :conversion_failure
        step :valid_json?
        step :output_file
        step :save_to_database

        def accept_file_input(ctx, **)
            # accept file form user file must be CSV or YAML
        end

        def validate_input_file(ctx, **)
            # check if is CSV or YAML and file is not empty
        end

        def convert_to_json(ctx, **)
            # convert file into json format (Name, DOB, Email)
        end

        def conversion_failure(ctx, **)
            # if conversion fails show error on failed line
        end

        def validate_json(ctx, **)
            # validate values as age > 18 and correct email format
        end

        def output_file(ctx, **)
            # Output file without procssing in case of error
        end

        def save_to_database(ctx, **)
            # After success in convert_to_json and validate_json upload to database
        end
    end
end