# jekyll-scholar は style: にスタイル名（apa 等）またはファイルパスを指定するが、
# 慣例として csl: にカスタム CSL ファイルパスを書く場合がある。
# csl: が設定されていれば style: にコピーし、カスタム CSL が読み込まれるようにする。
Jekyll::Hooks.register :site, :after_init do |site|
  scholar = site.config['scholar']
  next unless scholar.is_a?(Hash) && scholar['csl']

  scholar['style'] = scholar['csl']
end
