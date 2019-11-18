load("@rules_foreign_cc//tools/build_defs:configure.bzl", "configure_make")

configure_make(
    name = "liblength",
    configure_options = [
      "--disable-shared",
      "--enable-static",
    ],
    lib_source = "//configure_transitive/liblength:all",
    static_libraries = ["liblength.a"],
    # https://github.com/bazelbuild/rules_foreign_cc/pull/315
    configure_env_vars = {
      "AR": "",
    },
    visibility = ["//visibility:public"],
)

configure_make(
    name = "libarea",
    configure_options = [
      "--disable-shared",
      "--enable-static",
    ],
    lib_source = "//configure_transitive/libarea:all",
    static_libraries = ["libarea.a"],
    deps = [
        "//configure_transitive:liblength",
    ],
    # https://github.com/bazelbuild/rules_foreign_cc/pull/315
    configure_env_vars = {
      "AR": "",
    },
    visibility = ["//visibility:public"],
)

configure_make(
    name = "libvolume",
    configure_options = [
      "--disable-shared",
      "--enable-static",
    ],
    lib_source = "//configure_transitive/libvolume:all",
    static_libraries = ["libvolume.a"],
    # https://github.com/bazelbuild/rules_foreign_cc/pull/315
    configure_env_vars = {
      "AR": "",
    },
    deps = [
        "//configure_transitive:libarea",
    ],
    visibility = ["//visibility:public"],
)

cc_test(
    name = "test",
    srcs = ["test.c"],
    deps = [":libvolume"],
)
