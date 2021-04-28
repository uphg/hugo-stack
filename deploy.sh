# 确保脚本抛出遇到的错误
set -e

# 删除之前的文件
rm -rf public/

# 生成静态文件
hugo

# 进入生成的文件夹
cd public

# 添加 .nojekyll 防止 GitHub 访问 _ 开头的图片失效，参考：https://github.community/t/error-404-for-image-file-via-pages-which-exists-in-repository/10880
touch .nojekyll

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'update'

# 如果发布到 https://<USERNAME>.github.io  USERNAME=你的用户名 
git push -f git@github.com:uphg/hugo-stack.git master:gh-pages

# 如果发布到 https://<USERNAME>.github.io/<REPO>  REPO=github上的项目
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -