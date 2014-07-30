#!/usr/bin/python2

from __future__ import print_function
import i3
workspaces = i3.get_tree()
#print workspaces['nodes'][1]['nodes'][1]['nodes'][2]['nodes']
#print workspaces['nodes'][1]['nodes'][1]['nodes'][2]['

#print workspaces['nodes'][1]['nodes'][1]['nodes'][0]['nodes'][0]['layout']

# print (workspaces['nodes'][1]['nodes'][1]['nodes'][0]['name']) --> 1:www
# print (workspaces['nodes'][1]['nodes'][1]['nodes'][1]['name']) --> 2:term
#print (workspaces['nodes'][1]['nodes'][1]['nodes'][2]['name']) --> 3:dev

try:
	i = 0
	while i < 10:
		#print str(i+1 + ":") + workspaces['nodes'][1]['nodes'][1]['nodes'][i]['nodes'][0]['layout']
		layout = workspaces['nodes'][1]['nodes'][1]['nodes'][i]['nodes'][0]['layout']
		if layout == 'tabbed':
			layout = 'T'
		elif layout == 'splith':
			layout = 'S/H'
		else:
			layout = 'S/V'

		#print (str(i+1) + ':' + layout + ' ', end='')
		print (workspaces['nodes'][1]['nodes'][1]['nodes'][i]['name'][0] + ':' + layout + ' ', end='')
		i = i+1
except:
	pass