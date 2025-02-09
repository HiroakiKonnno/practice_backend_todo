# コンテナ起動時に実行されるスクリプト
#!sh

# エラー発生時点でスクリプト実行を止める
set -e

if [ "$SQLDEF_ACTION" = "apply" ]; then
	mysqldef -u ${MYSQL_USER:-manager} -p${MYSQL_PASSWORD:-password} -h ${MYSQL_HOST:-db} -P ${MYSQL_PORT:-3306} ${MYSQL_DATABASE:-todo_development} < schema.sql
elif [ "$SQLDEF_ACTION" = "apply-enable-drop-table" ]; then
	mysqldef -u ${MYSQL_USER:-manager} -p${MYSQL_PASSWORD:-password} -h ${MYSQL_HOST:-db} -P ${MYSQL_PORT:-3306} ${MYSQL_DATABASE:-todo_development} < schema.sql --enable-drop-table
else
	# デフォルトモード: dry-run（実行計画の表示のみ）
	# 実際の変更は行わず、実行されるSQLの計画のみを表示
	mysqldef -u ${MYSQL_USER:-manager} -p${MYSQL_ROOT_PASSWORD:-password} -h ${MYSQL_HOST:-db} -P ${MYSQL_PORT:-3306} ${MYSQL_DATABASE:-todo_development} < schema.sql --dry-run
fi
