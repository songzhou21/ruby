#include "gdbm.h"
#include <ruby.h>

static VALUE rb_cMiniDB;
Init_minidb() {
    rb_cMiniDB = rb_define_class("MiniDB", rb_cObject);

    rb_define_alloc_func(rb_cMiniDB, minidb_alloc);

    rb_define_method(rb_cMiniDB, "initialize", minidb_init, 1);
    rb_define_method(rb_cMiniDB, "[]", minidb_get, 1);
    rb_define_method(rb_cMiniDB, "[]=", minidb_set, 2);
    rb_define_method(rb_cMiniDB, "close", minidb_close, 0);
    rb_define_method(rb_cMiniDB, "each", minidb_each, 0);

    rb_include_module(rb_cMiniDB, rb_mEnumerable);
}

static void
minidb_free(DEPOT *db) {
    if (db)  {
        dpclose(db);
    }
}

static VALUE
minidb_alloc(VALUE klass) {
    return Data_Wrap_Struct(klass, 0, minidb_free, NULL);
}

static VALUE
minidb_init(VALUE self, VALUE path)
{
    DEPOT *db;
    SafeStringValue(path);
    db = dpopen(RSTRING_PTR(path), DP_OREADER|DP_OWRITER|DP_OCREAT, 0);
    if (!db) {
        rb_raise(rb_eRuntimeError, "dpopen - %s", dperrmsg(dpecode));
    }
    DATA_PTR(self) = db;
    return self;
}

static VALUE
minidb_get(VALUE self, VALUE key)
{
    DEPOT *db;
    char *p;
    int len;
    VALUE str;
    Data_Get_Struct(self, DEPOT, db);
    StringValue(key);
    p = dpget(db, RSTRING_PTR(key), RSTRING_LEN(key), 0, -1, &len);
    str = rb_tainted_str_new(p, len);
    free(p);
    return str;
}

static VALUE
minidb_set(VALUE self, VALUE key, VALUE val)
{
    DEPOT *db;
    Data_Get_Struct(self, DEPOT, db);
    StringValue(key);
    StringValue(val);
    if (!dpput(db, RSTRING_PTR(key), RSTRING_LEN(key),
               RSTRING_PTR(val), RSTRING_LEN(val), DP_DOVER)) {
         rb_raise(rb_eRuntimeError, "dpput failed");
    }
    return val;
}

static VALUE
minidb_close(VALUE self)
{
    DEPOT *db;
    Data_Get_Struct(self, DEPOT, db);
    dpclose(db);
    DATA_PTR(self) = 0;
    return Qnil;
}

static VALUE
minidb_each(VALUE self)
{
    DEPOT * db;
    char *p;
    int len;
    VALUE key;
    Data_Get_Struct(self, DEPOT, db);
    dpiterinit(db);
    for(;;) {
        p = dpiternext(db, &len);
        if (!p) break;
        key = rb_tainted_str_new(p, len);
        rb_yield_values(2, key, minidb_get(self, key));
    }
    return self;
}

static VALUE
minidb_get(VALUE self, VALUE key)
{
    DEPOT *db;
    char *p;
    int len;
    VALUE str;
    Data_Get_Struct(self, DEPOT, db);
    StringValue(key);
    p = dpget(db, RSTRING_PTR(key), RSTRING_LEN(key), 0, -1, &len);
    str = rb_tainted_str_new(p, len);
    free(p);
    return str;
}

static VALUE
minidb_set(VALUE self, VALUE key, VALUE val)
{
    DEPOT *db;
    Data_Get_Struct(self, DEPOT, db);
    StringValue(key);
    StringValue(val);
    if (!dpput(db, RSTRING_PTR(key), RSTRING_LEN(key),
               RSTRING_PTR(val), RSTRING_LEN(val), DP_DOVER)) {
         rb_raise(rb_eRuntimeError, "dpput failed");
    }
    return val;
}

static VALUE
minidb_close(VALUE self)
{
    DEPOT *db;
    Data_Get_Struct(self, DEPOT, db);
    dpclose(db);
    DATA_PTR(self) = 0;
    return Qnil;
}

static VALUE
minidb_each(VALUE self)
{
    DEPOT * db;
    char *p;
    int len;
    VALUE key;
    Data_Get_Struct(self, DEPOT, db);
    dpiterinit(db);
    for(;;) {
        p = dpiternext(db, &len);
        if (!p) break;
        key = rb_tainted_str_new(p, len);
        rb_yield_values(2, key, minidb_get(self, key));
    }
    return self;
}
