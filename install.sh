#!/usr/bin/env bash

# 检测npm安装情况
check_npm_install() {
	type npm &> /dev/null

	if [ $? -eq 1 ]; then
		echo "[warning] 未检测到npm安装，请先安装node和npm"
		exit 1
	fi
}

# 安装 yarn
check_yarn_install(){
	type yarn &> /dev/null

	if [ $? -eq 1 ]; then
		echo "[warning] 未检测到yarn安装，开始安装yarn..."
		npm i -g yarn
	fi
}

# 安装npm源
install_npm_registry(){
    echo "开始安装npm源..."
	npm config set registry https://registry.npm.taobao.org
	npm config set disturl https://npm.taobao.org/dist
	npm config set chromedriver_cdnurl http://cdn.npm.taobao.org/dist/chromedriver
	npm config set operadriver_cdnurl http://cdn.npm.taobao.org/dist/operadriver
	npm config set phantomjs_cdnurl http://cdn.npm.taobao.org/dist/phantomjs
	npm config set fse_binary_host_mirror https://npm.taobao.org/mirrors/fsevents
	npm config set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass
	npm config set electron_mirror http://cdn.npm.taobao.org/dist/electron/
}

# 安装yarn源
install_yarn_registry(){
    echo "开始安装yarn源..."
	yarn config set registry https://registry.npm.taobao.org
	yarn config set disturl https://npm.taobao.org/dist
	yarn config set chromedriver_cdnurl http://cdn.npm.taobao.org/dist/chromedriver
	yarn config set operadriver_cdnurl http://cdn.npm.taobao.org/dist/operadriver
	yarn config set phantomjs_cdnurl http://cdn.npm.taobao.org/dist/phantomjs
	yarn config set fse_binary_host_mirror https://npm.taobao.org/mirrors/fsevents
	yarn config set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass
	yarn config set electron_mirror http://cdn.npm.taobao.org/dist/electron/
}

# clean cache
cache_clean(){
    echo "开始清空cache..."
    npm cache clean --force
    yarn cache clean
}

# run
check_npm_install
check_yarn_install
install_npm_registry
install_yarn_registry
cache_clean
echo "[done] 安装完成!"
