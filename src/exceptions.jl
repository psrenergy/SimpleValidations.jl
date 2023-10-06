struct ValidationException <: Exception
    message::String
end

function ValidationException()
    message = "$(length(VALIDATIONS)) validation errors"
    return ValidationException(message)
end
