function _create_validation_dict(validation_error::ValidationError)
    return OrderedDict{String,Any}(
        "message" => validation_error.message,
        "element_name" => validation_error.element_name,
        "element_collection" => validation_error.element_collection,
        "element_identifier" => validation_error.element_identifier,
    )
end

_create_validation_vector_dict() =  [_create_validation_dict(validation_error) for validation_error in VALIDATIONS]

function dump_validation_errors(path::String)
    Base.open(path, "w") do io
        return JSON.print(io, _create_validation_vector_dict())
    end
end
