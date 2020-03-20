There were a lot of other warnings; search for "warning" in docker-log to see the rest. But this one seems likely to be particularly important:

Warnings during Docker build, at the step that runs `gremlin-server.sh -i`:

```
Step 25/34 : RUN chmod u+x /root/gremlin/bin/gremlin-server.sh      &&               /root/gremlin/bin/gremlin-server.sh -i                    org.apache.tinkerpop neo4j-gremlin 3.2.5
 ---> Running in d9681a3634a8
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.codehaus.groovy.reflection.CachedClass (file:/root/apache-tinkerpop-gremlin-server-3.2.5/lib/groovy-2.4.11-indy.jar) to method java.lang.Object.finalize()
WARNING: Please consider reporting this to the maintainers of org.codehaus.groovy.reflection.CachedClass
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
Could not install the dependency: Error grabbing Grapes -- [unresolved dependency: org.apache.tinkerpop#neo4j-gremlin;3.2.5: not found]
java.lang.RuntimeException: Error grabbing Grapes -- [unresolved dependency: org.apache.tinkerpop#neo4j-gremlin;3.2.5: not found]
        at org.codehaus.groovy.vmplugin.v7.IndyInterface.selectMethod(IndyInterface.java:232)
        at groovy.grape.GrapeIvy.getDependencies(GrapeIvy.groovy:424)
        at org.codehaus.groovy.vmplugin.v7.IndyInterface.selectMethod(IndyInterface.java:232)
        at groovy.grape.GrapeIvy.resolve(GrapeIvy.groovy:571)
        at org.codehaus.groovy.vmplugin.v7.IndyInterface.selectMethod(IndyInterface.java:232)
        at groovy.grape.GrapeIvy.resolve(GrapeIvy.groovy:534)
        at groovy.grape.Grape.resolve(Grape.java:202)
        at org.codehaus.groovy.vmplugin.v7.IndyInterface.selectMethod(IndyInterface.java:232)
        at org.apache.tinkerpop.gremlin.groovy.util.DependencyGrabber.copyDependenciesToPath(DependencyGrabber.groovy:124)
        at org.codehaus.groovy.vmplugin.v7.IndyInterface.selectMethod(IndyInterface.java:232)
        at org.apache.tinkerpop.gremlin.groovy.util.DependencyGrabber.copyDependenciesToPath(DependencyGrabber.groovy:77)
        at org.apache.tinkerpop.gremlin.server.util.GremlinServerInstall.main(GremlinServerInstall.java:38)
Removing intermediate container d9681a3634a8
 ---> 61dfbfaa8baf
```
