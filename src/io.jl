function dump_errors(path::String)
    if isfile(path)
        rm(path)
    end
    open(path, "a+") do io
        print(io, "[")
        for error_i in eachindex(VALIDATIONS.errors_list)
            JSON.print(io, Dict(
                "message" => VALIDATIONS.errors_list[error_i].message, 
                "validation_type" => typeof(VALIDATIONS.errors_list[error_i].validation_type), 
                "element_name" => VALIDATIONS.errors_list[error_i].element_name, 
                "element_collection" => VALIDATIONS.errors_list[error_i].element_collection
            ))
            if error_i != VALIDATIONS.num_errors
                print(io, ",")
            end
        end
        print(io, "]")
    end
end