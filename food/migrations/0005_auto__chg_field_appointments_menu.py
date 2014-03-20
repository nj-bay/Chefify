# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Appointments.menu'
        db.alter_column(u'food_appointments', 'menu_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Menu'], null=True))

    def backwards(self, orm):

        # User chose to not deal with backwards NULL issues for 'Appointments.menu'
        raise RuntimeError("Cannot reverse this migration. 'Appointments.menu' and its values cannot be restored.")
        
        # The following code is provided here to aid in writing a correct migration
        # Changing field 'Appointments.menu'
        db.alter_column(u'food_appointments', 'menu_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Menu']))

    models = {
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'food.appointments': {
            'Meta': {'object_name': 'Appointments'},
            'chef': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.Chef']", 'null': 'True'}),
            'customer': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.Customer']"}),
            'end_time': ('django.db.models.fields.DateTimeField', [], {}),
            'event_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.EventType']"}),
            'has_menu': ('django.db.models.fields.BooleanField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.Location']"}),
            'menu': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.Menu']", 'null': 'True'}),
            'number_of_guests': ('django.db.models.fields.PositiveSmallIntegerField', [], {}),
            'ratings': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'start_time': ('django.db.models.fields.DateTimeField', [], {}),
            'status': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'food.chef': {
            'Meta': {'object_name': 'Chef'},
            'chefify_user': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['food.ChefifyUser']", 'unique': 'True'}),
            'cuisine': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "'chefs'", 'null': 'True', 'to': u"orm['food.Cuisine']"}),
            'equipment_charge': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'has_equipment': ('django.db.models.fields.BooleanField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'price_maximum': ('django.db.models.fields.DecimalField', [], {'default': "'0'", 'null': 'True', 'max_digits': '8', 'decimal_places': '2'}),
            'price_minimum': ('django.db.models.fields.DecimalField', [], {'default': "'0'", 'null': 'True', 'max_digits': '8', 'decimal_places': '2'}),
            'restaurant': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True'}),
            'travel_radius': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        u'food.chefifyuser': {
            'Meta': {'object_name': 'ChefifyUser'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Group']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'menu': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.Menu']", 'null': 'True', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'food.cuisine': {
            'Meta': {'object_name': 'Cuisine'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'food.customer': {
            'Meta': {'object_name': 'Customer'},
            'chefify_user': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['food.ChefifyUser']", 'unique': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        u'food.dish': {
            'Meta': {'object_name': 'Dish'},
            'cuisine': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.Cuisine']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.DishType']"})
        },
        u'food.dishtype': {
            'Meta': {'object_name': 'DishType'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'food.eventtype': {
            'Meta': {'object_name': 'EventType'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'food.location': {
            'Meta': {'object_name': 'Location'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6'}),
            'longitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'zip_code': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'food.menu': {
            'Meta': {'object_name': 'Menu'},
            'cuisine': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['food.Cuisine']"}),
            'dishes': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['food.Dish']", 'symmetrical': 'False'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['food']