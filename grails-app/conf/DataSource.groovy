dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "tasks"
    password = "tasks"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 4
    dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
                        dbCreate = "update"
            // servidor instalado localmente
            url = "jdbc:mysql://localhost:3306/tasks"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/tasks"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://192.168.2.20:3306/tasks"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                maxActive = -1
                minEvictableIdleTimeMillis=1800000
                timeBetweenEvictionRunsMillis=1800000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=false
                validationQuery="SELECT 1"
                jdbcInterceptors="ConnectionState"
                jmxEnabled = true
                initialSize = 5
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                validationQueryTimeout = 3
                validationInterval = 15000
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}