(defpackage :test-asdf/monodll-1 (:use)) ;; dummy, for package-inferred-system dependencies.

#+(and ecl (not clasp))
(ffi:clines "
extern int always_7();

int always_7()
{
        return 7;
}
")

#+clasp(error "handle me")

#+mkcl
(ffi:clines "
extern MKCL_DLLEXPORT int always_7(void);

int always_7(void)
{
        return 7;
}
")
