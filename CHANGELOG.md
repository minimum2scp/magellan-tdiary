## 0.1.16 (2019-07-24)

 * Update debian to 10 (buster)
 * Update ruby to 2.6.3
 * Update tdiary to 5.0.14
 * Update tdiary-contrib to 5.0.13
 * Update nginx to 1.16 in docker-compose.yml

## 0.1.15 (2019-03-06)

 * Update ruby to 2.6.1
 * Update tdiary-core, tdiary-contrib to 5.0.11
 * Update tdiary-style-gfm to 1.2.0
 * Update magellan-proxy to 0.1.9
 * Update nginx to 1.14, mysql to 5.7 in docker-compose.yml
 * Install libidn11-dev package for tdiary-style-gfm gem dependency

## 0.1.14 (2016-07-01)

 * Update tdiary-core, tdiary-contrib to 5.0.1

## 0.1.13 (2016-06-16)

 * Update magellan-proxy to 0.1.5
 * Added environment variable `TIMEZONE`
 * Install stackprof gem to install latest flamegraph (v0.9.5)

## 0.1.12 (2016-05-09)

 * Upgrade docker-compose.yml format to version 2
 * Dropped support of legacy container links in entrypoint script
 * Update ruby to 2.3.1
 * Locked versions of tdiary-{core,contrib,cache-null,io-rdb,style-gfm}
 * Update magellan-proxy to 0.1.4

## 0.1.11 (2016-03-30)

 * Update tdiary-core, tdiary-contrib to 5.0.0

## 0.1.10 (2016-02-15)

 * Update magellan-proxy to 0.1.3

## 0.1.9 (2016-01-14)

 * Drop tdiary-cache-redis, and use tdiary-cache-null

## 0.1.8 (2015-12-31)

 * Update ruby to 2.3.0
 * Update tdiary-core, tdiary-contrib to 4.2.1

## 0.1.7 (2015-10-25)

 * Update magellan-proxy to 0.1.1

## 0.1.6 (2015-10-08)

 * Update magellan-proxy to 0.1.0

## 0.1.5 (2015-09-30)

 * Update tdiary-core, tdiary-contrib to 4.2.0

## 0.1.4 (2015-09-18)

 * Fixed DB connection problem
   (exception `Sequel::DatabaseError: Mysql2::Error: Table 'conf' already exists` after MySQL connection lost)
 * Fixed Redis connection problem
   (excepption `Redis::CommandError ERR max number of clients reached` after processed several requests)
 * Enabled Ruby garbage collection instrumentation (`GC::Profiler.enable`) by default
 * Store data into local file when `MYSQL_*` environment variables are not set

## 0.1.3 (2015-09-16)

 * Install `newrelic_rpm` gem for monitoring
 * Install `rack-mini-profiler`, `flamegraph` gem for profiling
 * Set magellan-proxy -n (--num) option to 5, changed passenger --max-pool-size to 3

## 0.1.2 (2015-09-13)

 * Update magellan-proxy to 0.0.2
 * Redis cache support (tdiary-cache-redis)
 * Enabled `theme_online` plugin by default
 * Copy js, theme into public/assets by `rake assets:copy`
 * Use passenger instead of puma
 * Add CSRF protection settings

## 0.1.1 (2015-09-10)

 * Update magellan-proxy to 0.0.2.pre
 * Create database if not exist
 * Basic Auth username and password defaults to `tdiary`, `tdiary`

## 0.1.0 (2015-09-03)

 * Initial version

