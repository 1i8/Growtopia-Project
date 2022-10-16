function log(...)
    local args = {...};
    return LogToConsole(os.date('%X'), unpack(args));
end

