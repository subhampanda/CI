resource "aws_db_snapshot" "subham-createSnapshot" {
db_instance_identifier = "${var.db_instance_identifier}"
db_snapshot_identifier = "${var.db_snapshot_identifier}"
}

resource "aws_db_instance" "subham-restoreDB" {
depends_on = [aws_db_snapshot.subham-createSnapshot]
instance_class = "${var.instance_class}"
identifier = "${var.identifier}"
snapshot_identifier = "${var.db_snapshot_identifier}"
skip_final_snapshot = true
final_snapshot_identifier = "${var.identifier}-backup"

}
