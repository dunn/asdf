(defpackage :test-asdf/dll-test (:use)) ;; dummy, for package-inferred-system dependencies.

#+(and ecl (not clasp))
(ffi:clines "
extern int sample_function();

int sample_function()
{
        return 42;
}
")

#+clasp(error "handle me")

#+mkcl
(ffi:clines "
extern MKCL_DLLEXPORT int sample_function(void);

int sample_function(void)
{
        return 42;
}
")
