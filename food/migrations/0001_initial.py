# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'EventType'
        db.create_table(u'food_eventtype', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('type', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('food', ['EventType'])

        # Adding model 'Cuisine'
        db.create_table(u'food_cuisine', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('type', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('food', ['Cuisine'])

        # Adding model 'DishType'
        db.create_table(u'food_dishtype', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('type', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('food', ['DishType'])

        # Adding model 'Menu'
        db.create_table(u'food_menu', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('chef_id', self.gf('django.db.models.fields.related.ForeignKey')(related_name='menus', to=orm['food.Chef'])),
            ('cuisine', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Cuisine'])),
            ('dishes', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.DishType'])),
        ))
        db.send_create_signal('food', ['Menu'])

        # Adding model 'Chef'
        db.create_table(u'food_chef', (
            (u'user_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.User'], unique=True, primary_key=True)),
            ('menu', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Menu'])),
            ('price_minimum', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('price_maximum', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('has_equipment', self.gf('django.db.models.fields.BooleanField')()),
            ('equipment_charge', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('travel_radius', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('food', ['Chef'])

        # Adding model 'Customer'
        db.create_table(u'food_customer', (
            (u'user_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.User'], unique=True, primary_key=True)),
            ('menu', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Menu'])),
        ))
        db.send_create_signal('food', ['Customer'])

        # Adding model 'Status'
        db.create_table(u'food_status', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=20)),
        ))
        db.send_create_signal('food', ['Status'])

        # Adding model 'Location'
        db.create_table(u'food_location', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('address', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('city', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('state', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('zip_code', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('latitude', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=9, decimal_places=6)),
            ('longitude', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=9, decimal_places=6)),
        ))
        db.send_create_signal('food', ['Location'])

        # Adding model 'Appointments'
        db.create_table(u'food_appointments', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('chef_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Chef'])),
            ('customer_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Customer'])),
            ('ratings', self.gf('django.db.models.fields.PositiveIntegerField')(null=True)),
            ('start_time', self.gf('django.db.models.fields.DateTimeField')()),
            ('end_time', self.gf('django.db.models.fields.DateTimeField')()),
            ('number_of_guests', self.gf('django.db.models.fields.PositiveSmallIntegerField')()),
            ('event_type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.EventType'])),
            ('has_menu', self.gf('django.db.models.fields.BooleanField')()),
            ('menu', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Menu'])),
            ('status', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Status'])),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['food.Location'])),
        ))
        db.send_create_signal('food', ['Appointments'])


    def backwards(self, orm):
        # Deleting model 'EventType'
        db.delete_table(u'food_eventtype')

        # Deleting model 'Cuisine'
        db.delete_table(u'food_cuisine')

        # Deleting model 'DishType'
        db.delete_table(u'food_dishtype')

        # Deleting model 'Menu'
        db.delete_table(u'food_menu')

        # Deleting model 'Chef'
        db.delete_table(u'food_chef')

        # Deleting model 'Customer'
        db.delete_table(u'food_customer')

        # Deleting model 'Status'
        db.delete_table(u'food_status')

        # Deleting model 'Location'
        db.delete_table(u'food_location')

        # Deleting model 'Appointments'
        db.delete_table(u'food_appointments')


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
        u'auth.user': {
            'Meta': {'object_name': 'User'},
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
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'food.appointments': {
            'Meta': {'object_name': 'Appointments'},
            'chef_id': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Chef']"}),
            'customer_id': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Customer']"}),
            'end_time': ('django.db.models.fields.DateTimeField', [], {}),
            'event_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.EventType']"}),
            'has_menu': ('django.db.models.fields.BooleanField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Location']"}),
            'menu': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Menu']"}),
            'number_of_guests': ('django.db.models.fields.PositiveSmallIntegerField', [], {}),
            'ratings': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True'}),
            'start_time': ('django.db.models.fields.DateTimeField', [], {}),
            'status': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Status']"})
        },
        'food.chef': {
            'Meta': {'object_name': 'Chef'},
            'equipment_charge': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'has_equipment': ('django.db.models.fields.BooleanField', [], {}),
            'menu': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Menu']"}),
            'price_maximum': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'price_minimum': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'travel_radius': ('django.db.models.fields.PositiveIntegerField', [], {}),
            u'user_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['auth.User']", 'unique': 'True', 'primary_key': 'True'})
        },
        'food.cuisine': {
            'Meta': {'object_name': 'Cuisine'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'food.customer': {
            'Meta': {'object_name': 'Customer'},
            'menu': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Menu']"}),
            u'user_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['auth.User']", 'unique': 'True', 'primary_key': 'True'})
        },
        'food.dishtype': {
            'Meta': {'object_name': 'DishType'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'food.eventtype': {
            'Meta': {'object_name': 'EventType'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'food.location': {
            'Meta': {'object_name': 'Location'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6'}),
            'longitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'zip_code': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'food.menu': {
            'Meta': {'object_name': 'Menu'},
            'chef_id': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'menus'", 'to': "orm['food.Chef']"}),
            'cuisine': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.Cuisine']"}),
            'dishes': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['food.DishType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'food.status': {
            'Meta': {'object_name': 'Status'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['food']