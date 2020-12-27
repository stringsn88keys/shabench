# shabench
Trivial benchmarking for random environments.

# TODO:
Benchmark multi-run vs. just running once.

# Data
##  Lambda @ 128MB
```json
{
  "statusCode": 200,
  "body": "{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":6.536189388999901}"
}
```
## Lambda @ 1024MB

```json
{
  "statusCode": 200,
  "body": "{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":0.7233408910001344}"
}
```

## Lambda @ 10240MB
```json
{
  "statusCode": 200,
  "body": "{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":0.40237845800038485}"
}
```

## 9750H mac
### 2.7.0
```json
{:statusCode=>200, :body=>"{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":0.3909989999374375}"}
```

### 2.7.1
```json
{:statusCode=>200, :body=>"{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":0.4104339999612421}"}
```
### 3.0.0
{:statusCode=>200, :body=>"{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":0.3773950000759214}"}

## 1.8 GHz Dual-Core Intel Core i5 MacBook Air (13-inch, Mid 2012) on macOS 10.15.6
### 2.7.2
```json
{:statusCode=>200, :body=>"{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":1.0013480000000072}"}}
```

## Linode
### 2.7.1
```json
{:statusCode=>200, :body=>"{\"source\":\"Message0000149001\",\"digest\":\"ROWcGPDpcyeSIzWlyXTFQk7+dYS8OoF6sHFuEXQBiosKMknaaH8xcb0nXhmIe5Lp1bXcCV1+WCdsQlmzo9neWA==\",\"times\":0.6737725229468197}"}
```
