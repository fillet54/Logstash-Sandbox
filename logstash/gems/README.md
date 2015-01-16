# Ruby GEM installation for logstash

Ruby gems can be installed to be used by additional plugins. Run this command

```bash
env GEM_HOME=../app/logstash-1.4.2/vendor/bundle/jruby/1.9 GEM_PATH="./" java -jar ../app/logstash-1.4.2/vendor/jar/jruby-complete-1.7.11.jar -S gem install <insert gemname here>
```

so gemname for above could be 'bindata'
