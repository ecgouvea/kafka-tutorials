STEPS_DIR := tutorial-steps
DEV_OUTPUTS_DIR := $(STEPS_DIR)/dev/outputs
TEST_OUTPUTS_DIR := $(STEPS_DIR)/test/outputs
PROD_OUTPUTS_DIR := $(STEPS_DIR)/prod/outputs
TEMP_DIR := $(shell mktemp -d)

tutorial:
	rm -r $(DEV_OUTPUTS_DIR) || true
	rm -r $(TEST_OUTPUTS_DIR) || true
	mkdir $(DEV_OUTPUTS_DIR)
	mkdir $(TEST_OUTPUTS_DIR)
	harness-runner ../../../../../_data/harnesses/aggregating-minmax/ksql.yml $(TEMP_DIR)
	bash -c "diff --strip-trailing-cr <(sort $(STEPS_DIR)/dev/expected-transient-query.log) <(sort $(DEV_OUTPUTS_DIR)/transient-query/output-0.log)"
	bash -c "diff --strip-trailing-cr <(sort <(cut -d ',' -f 3- $(STEPS_DIR)/dev/expected-print-output-topic.log)) <(sort <(cut -d ',' -f 3- $(DEV_OUTPUTS_DIR)/print-output-topic/output-0.log))"
	bash -c "diff --strip-trailing-cr <(sort $(STEPS_DIR)/test/expected-results.log) <(sort $(TEST_OUTPUTS_DIR)/test-results.log)"
