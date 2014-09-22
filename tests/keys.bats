#!/usr/bin/env bats

load test_helpers

@test "list keys of an empty store succeeds" {
    run $TROUSSEAU_BINARY --store $TROUSSEAU_TEST_STORE keys

    [ "$status" -eq 0 ]
}

@test "list keys of a fulfilled store succeeds" {
    # Prepare the data store and environement
    run $TROUSSEAU_BINARY --store $TROUSSEAU_TEST_STORE set abc 123
    run $TROUSSEAU_BINARY --store $TROUSSEAU_TEST_STORE keys

    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "abc" ]
}

