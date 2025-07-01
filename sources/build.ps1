cd flex-sc-src
git pull
cd ..

echo "Cleaning up old UFOs..."
Remove-Item -Path flex-sc-han/han_Bold.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path flex-sc-han/han_Regular.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path flex-sc-han/han_Thin.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path FlexSansGBVF/masters/han_Bold.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path FlexSansGBVF/masters/han_Regular.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path FlexSansGBVF/masters/han_Thin.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path FlexSansGBVF/masters/Bold.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path FlexSansGBVF/masters/Regular.ufo -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path FlexSansGBVF/masters/Thin.ufo -Recurse -Force -ErrorAction SilentlyContinue

# require installing fontra and fontra-rcjk in venv
echo "Converting RCJK to designspace..."
mkdir -Force flex-sc-han
fontra-copy export-rcjk.yaml flex-sc-han\han.designspace

echo "Copying RCJK UFOs to FlexSansGB masters..."
Copy-Item "flex-sc-han\han_Bold.ufo" "FlexSansGBVF\masters\han_Bold.ufo" -Recurse -Force
Copy-Item "flex-sc-han\han_Regular.ufo" "FlexSansGBVF\masters\han_Regular.ufo" -Recurse -Force
Copy-Item "flex-sc-han\han_Thin.ufo" "FlexSansGBVF\masters\han_Thin.ufo" -Recurse -Force

cd "FlexSansGBVF\masters"

echo "Merging FlexSansGB Latin and CJK UFOs..."
ufomerge --skip-existing --layout-closure --output Bold.ufo "FlexSansGBVF-Bold.ufo\" "han_Bold.ufo"
ufomerge --skip-existing --layout-closure --output Regular.ufo "FlexSansGBVF-Regular.ufo\" "han_Regular.ufo"
ufomerge --skip-existing --layout-closure --output Thin.ufo "FlexSansGBVF-Thin.ufo\" "han_Thin.ufo"

cd ..
python add-ufo-vert-info.py
python add-vs-selector.py

Remove-Item -Path "instance_ufos" -Recurse -Force -ErrorAction SilentlyContinue

echo "Building FlexSansGB fonts..."
gftools builder config.yaml

echo "Building FlexSansGBVF font..."
fontmake -m "Flex Sans GB.designspace" -o variable --output-path "../../fonts/variable/Flex Sans GB[wght].ttf"
gftools gen-stat "../../fonts/variable/Flex Sans GB[wght].ttf" --src stat.yaml --inplace

# Stop-Computer -Force