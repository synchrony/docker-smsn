Error from Gremlin, after launching the Docker container:

```
root@127:~/apache-tinkerpop-gremlin-server-3.2.5# ./start-smsn.sh
LC_ALL=en_US.UTF-8
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*
.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:
*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*
.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*
.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00
;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
LESSCLOSE=/usr/bin/lesspipe %s %s
_=/usr/bin/env
LANG=en_US.UTF-8
HOSTNAME=127.0.0.1
PWD=/root/apache-tinkerpop-gremlin-server-3.2.5
HOME=/root
TERM=xterm
SHLVL=2
LANGUAGE=en_US:en
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
LESSOPEN=| /usr/bin/lesspipe %s
./start-smsn.sh: line 10: ip: command not found
Using host
mv: cannot stat 'gremlin-server.log': No such file or directory
[INFO] GremlinServer -
         \,,,/
         (o o)
-----oOOo-(3)-oOOo-----

[INFO] GremlinServer - Configuring Gremlin Server from conf/gremlin-server-smsn.yaml
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by io.netty.util.internal.PlatformDependent0$1 (file:/root/apache-tinkerpop-gremlin-server-3.2.5/lib/netty-all-4.0.42.Final.jar) to field java.nio.Buffer.address
WARNING: Please consider reporting this to the maintainers of io.netty.util.internal.PlatformDependent0$1
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
[INFO] DefaultGraphManager - Graph [graph] was successfully configured via [conf/neo4j.properties].
[INFO] ServerGremlinExecutor - Initialized Gremlin thread pool.  Threads in pool named with pattern gremlin-*
[INFO] ScriptEngines - Loaded smsn ScriptEngine
[INFO] ScriptEngines - Loaded gremlin-groovy ScriptEngine
INFO: Thu Mar 19 23:33:44 GMT 2020: net.fortytwo.smsn.SemanticSynchrony loadYamlFromDefaultLocation: using default Semantic Synchrony configuration
INFO: Thu Mar 19 23:33:44 GMT 2020: net.fortytwo.smsn.server.SmSnScriptEngine readAsYaml: added configuration
INFO: Thu Mar 19 23:33:44 GMT 2020: net.fortytwo.smsn.server.Action getBrain: instantiating Extend-o-Brain with base graph neo4jgraph[Community [/mnt/smsn-data/neo4j]]
INFO: Thu Mar 19 23:33:44 GMT 2020: net.fortytwo.smsn.server.Action handleRequest: completed NoAction action in 1 ms
[WARN] GremlinExecutor - Initialization script conf/smsn.yaml did not return a Map - no global bindings specified
[INFO] GremlinExecutor - Initialized smsn ScriptEngine with conf/smsn.yaml
[INFO] GremlinExecutor - Initialized gremlin-groovy ScriptEngine with scripts/empty-sample.groovy
[INFO] ServerGremlinExecutor - Initialized GremlinExecutor and preparing GremlinScriptEngines instances.
INFO: Thu Mar 19 23:33:44 GMT 2020: net.fortytwo.smsn.server.Action handleRequest: completed NoAction action in 0 ms
[INFO] ServerGremlinExecutor - Initialized smsn GremlinScriptEngine and registered metrics
[INFO] ServerGremlinExecutor - Initialized gremlin-groovy GremlinScriptEngine and registered metrics
[INFO] ServerGremlinExecutor - A GraphTraversalSource is now bound to [g] with graphtraversalsource[neo4jgraph[Community [/mnt/smsn-data/neo4j]], standard]
[INFO] OpLoader - Adding the standard OpProcessor.
[INFO] OpLoader - Adding the control OpProcessor.
[INFO] OpLoader - Adding the session OpProcessor.
[INFO] OpLoader - Adding the traversal OpProcessor.
[INFO] TraversalOpProcessor - Initialized cache for TraversalOpProcessor with size 1000 and expiration time of 600000 ms
[INFO] GremlinServer - Executing start up LifeCycleHook
[INFO] Logger$info - Executed once at startup of Gremlin Server.
[INFO] AbstractChannelizer - Configured application/vnd.gremlin-v1.0+gryo with org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV1d0
[INFO] AbstractChannelizer - Configured application/vnd.gremlin-v1.0+gryo-lite with org.apache.tinkerpop.gremlin.driver.ser.GryoLiteMessageSerializerV1d0
[INFO] AbstractChannelizer - Configured application/vnd.gremlin-v1.0+gryo-stringd with org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV1d0
[INFO] AbstractChannelizer - Configured application/vnd.gremlin-v1.0+json with org.apache.tinkerpop.gremlin.driver.ser.GraphSONMessageSerializerGremlinV1d0
[INFO] AbstractChannelizer - Configured application/vnd.gremlin-v2.0+json with org.apache.tinkerpop.gremlin.driver.ser.GraphSONMessageSerializerGremlinV2d0
[INFO] AbstractChannelizer - Configured application/json with org.apache.tinkerpop.gremlin.driver.ser.GraphSONMessageSerializerV1d0
[ERROR] GremlinServer - Gremlin Server Error
java.lang.IllegalArgumentException: hostname can't be null
        at java.base/java.net.InetSocketAddress.checkHost(InetSocketAddress.java:149)
        at java.base/java.net.InetSocketAddress.<init>(InetSocketAddress.java:216)
        at io.netty.bootstrap.AbstractBootstrap.bind(AbstractBootstrap.java:249)
        at org.apache.tinkerpop.gremlin.server.GremlinServer.start(GremlinServer.java:190)
        at org.apache.tinkerpop.gremlin.server.GremlinServer.main(GremlinServer.java:355)
[ERROR] GremlinServer - Gremlin Server was unable to start and will now begin shutdown: hostname can't be null
[INFO] GremlinServer - Shutting down OpProcessor[]
[INFO] GremlinServer - Shutting down OpProcessor[session]
[INFO] GremlinServer - Shutting down OpProcessor[control]
[INFO] GremlinServer - Shutting down OpProcessor[traversal]
[INFO] GremlinServer - Shutting down thread pools.
[INFO] GremlinServer - Executing shutdown LifeCycleHook
[INFO] Logger$info - Executed once at shutdown of Gremlin Server.
[INFO] GremlinServer - Closed Graph instance [graph]
[INFO] GremlinServer - Gremlin Server - shutdown complete
root@127:~/apache-tinkerpop-gremlin-server-3.2.5#
```
