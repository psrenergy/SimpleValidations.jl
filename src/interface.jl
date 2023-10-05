struct ValidationError
    message::String
    element_name::String
    element_collection::String
    element_identifier::Union{String, Real}
    function ValidationError(
        message::String,
        element_name::String,
        element_collection::String,
        element_identifier::Union{String, Real},
    )
        return new(message, element_name, element_collection, element_identifier)
    end
end
