module SimpleValidations

using JSON
using OrderedCollections
import LoggingPolyglot as Log

const _EXCLUDE_SYMBOLS = [Symbol(@__MODULE__), :eval, :include]

for sym in names(@__MODULE__; all = true)
    sym_string = string(sym)
    if sym in _EXCLUDE_SYMBOLS ||
       startswith(sym_string, "_") ||
       startswith(sym_string, "@_")
        continue
    end
    if !(
        Base.isidentifier(sym) ||
        (startswith(sym_string, "@") && Base.isidentifier(sym_string[2:end]))
    )
        continue
    end
    @eval export $sym
end

include("interface.jl")
include("validations.jl")
include("io.jl")


const VALIDATIONS = Vector{ValidationError}()


end # module SimpleValidations
