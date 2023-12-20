function _create_validation_dict(validation_error::ValidationError)
    return OrderedDict{String, Any}(
        "message" => validation_error.message,
        "attribute" => validation_error.attribute,
        "collection" => validation_error.collection,
        "identifier" => validation_error.identifier,
    )
end

function _create_validation_vector_dict()
    vector_validations_dict = Vector{OrderedDict{String, Any}}(undef, length(VALIDATIONS))
    for (i, validation_error) in enumerate(VALIDATIONS)
        vector_validations_dict[i] = _create_validation_dict(validation_error)
    end
    return vector_validations_dict
end

function dump_validation_errors(path::String)
    Base.open(path, "w") do io
        return JSON.print(io, _create_validation_vector_dict())
    end
end
