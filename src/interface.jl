struct ValidationError
    message::String
    attribute::String
    collection::String
    identifier::Union{String, Real}
    function ValidationError(
        message::String,
        attribute::String,
        collection::String,
        identifier::Union{String, Real},
    )
        return new(message, attribute, collection, identifier)
    end
end
