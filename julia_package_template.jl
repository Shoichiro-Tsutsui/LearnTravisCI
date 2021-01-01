using PkgTemplates

t = Template(;
            user="Shoichiro-Tsutsui", # GitHubのユーザー名
            dir=".",
            plugins=[
                License(; name="MIT"), # MITライセンスであることを明示する。
                TravisCI(), # CIサービスとしてTravisCIを使う
                Codecov(),
                Documenter{TravisCI}(), # ドキュメントのテンプレを作成する。
            ],
            )

t("MyPkg")
