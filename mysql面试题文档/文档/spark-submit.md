spark-submit \
--class org.sb.Main \
--master yarn \
--driver-memory 1g \
--executor-memory 1g \
--executor-cores 1 \
 /Users/apple/IdeaProjects/sp/target/sp-1.0-SNAPSHOT-jar-with-dependencies.jar  ./table.xlsx

