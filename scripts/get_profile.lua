wrk.method = "GET"

id = 1

request = function()
  path = "/profile/" .. id
  id = math.random(100)

  return wrk.format(nil, path)
end

done = function(summary, latency, requests)
  io.stderr:write("\n---------------------------------------\n")

  labels = {
    "duration",
    "requests",
    "requests/s total",
    "bytes",
    "errors.connect",
    "errors.read",
    "errors.write",
    "errors.status",
    "errors.timeout",
    "latency.min",
    "latency.max",
    "latency.mean",
    "latency.stdev",
    "latency.percentile:50",
    "latency.percentile:75",
    "latency.percentile:90",
    "latency.percentile:99",
    "latency.percentile:99.999",
  }

  out = {
    summary.duration / 1000000,
    summary.requests,
    summary.requests/(summary.duration/1000000),
    summary.bytes,
    summary.errors.connect,
    summary.errors.read,
    summary.errors.write,
    summary.errors.status,
    summary.errors.timeout,
    latency.min / 1000,
    latency.max / 1000,
    latency.mean / 1000,
    latency.stdev / 1000,
    latency:percentile(50) / 1000,
    latency:percentile(75) / 1000,
    latency:percentile(90) / 1000,
    latency:percentile(99) / 1000,
    latency:percentile(99.999) / 1000
  }

  for key, value in pairs(out) do
    if key > 1 then
      io.stderr:write(",\n")
    end
    if key == 1 then
      io.stderr:write(string.format("%s: %ds", labels[key],value))
    elseif key >= 10 then
      io.stderr:write(string.format("%s: %dms", labels[key],value))
    else
      io.stderr:write(string.format("%s: %d", labels[key],value))
    end
  end

end