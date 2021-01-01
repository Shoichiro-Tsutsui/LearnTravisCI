using DocumenterTools

GitHub_username = "Shoichiro-Tsutsui"
repository_name = "LearnTravisCI"

Travis.genkeys(
    user = GitHub_username,
    repo = "git@github.com:" * GitHub_username * "/" * repository_name *".git")
