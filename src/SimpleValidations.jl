module SimpleValidations

using JSON
import LoggingPolyglot as Log

include("interface.jl")
include("validations.jl")
include("io.jl")

const VALIDATIONS = DataBaseValidation()


end # module SimpleValidations
