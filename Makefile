
GENERATED_FILES = \
	dw.js/dw-2.0.js \
	www/static/css/datawrapper.css \
	www/static/css/chart.base.css

all: $(GENERATED_FILES)

clean:
	rm -f -- $(GENERATED_FILES)

dw.js/dw-2.0.js: dw.js/src/*.js
	cd dw.js; grunt

assets: www/static/css/datawrapper.css www/static/css/chart.base.css

messages:
	scripts/update-messages.sh

www/static/css/datawrapper.css: assets/styles/datawrapper/* assets/styles/datawrapper/**/*
	node_modules/.bin/lessc assets/styles/datawrapper/main.less > $@

www/static/css/chart.base.css: assets/styles/chart.base/*
	node_modules/.bin/lessc assets/styles/chart.base/main.less > $@
