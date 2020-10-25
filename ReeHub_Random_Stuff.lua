local LIB = {}
function LIB:FindFunc(v1, v23)
    for i,v in pairs(getgc(true)) do
        if type(v) == "function" and islclosure(v) then
            for i2,v2 in next, debug.getupvalues(v) do
                if type(v2) == "table" and rawget(v2, v1) then
                    return v2[v1];
                else
                    v23[v1] = nil
                end;
            end;
        end;
    end;
end;

function LIB:SetFunction(OldFunction, NewFunction)
    for i,v in pairs(getreg()) do
        if type(v) == "function" and islclosure(v) then
            for i2,v2 in next, debug.getupvalues(v) do
                if type(v2) == "table" and rawget(v2, OldFunction) then
                    v2[OldFunction] = NewFunction
                end;
            end;
        end;
    end;
end

return LIB
