library(httr)
library(httpuv)
# 1.OAuth settings for github:
Client_ID <- 'a440bffaf8798e6fa4f5'
Client_Secret <- '955cd207d97b6425d259b5ff9f402338f15601c3'
myapp <- oauth_app("Courseratest", key = Client_ID, secret = Client_Secret)
# 2. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 3. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
# 4. Extract out the content from the request
json1 = content(req)
# 5. convert the list to json
json2 = jsonlite::fromJSON(jsonlite::toJSON(json1))
# 6. Result 
json2[json2$full_name == "jtleek/datasharing", ]$created_at