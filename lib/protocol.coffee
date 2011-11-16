# Shared functions specified by [UPnP Device Protocol] [1], for
# both Devices and Services.
#
# [1]: http://upnp.org/index.php/sdcps-and-certification/standards/sdcps/

# Make namespace string.
exports.makeNameSpace = (category) ->
    version = @schema?.version || @device.schema.version
    [ @schema?.prefix || @device?.schema.prefix
      category
      version.split('.')[0]
      version.split('.')[1]
    ].join '-'

# Make Device/Service type string for SSDP messages
# and Service/Device descriptions.
makeType = (category) ->
    [ @schema?.prefix || @device.schema.prefix
      category
      @type
      @version || @device.version
    ].join ':'

exports.makeDeviceType = -> makeType.call @, 'device'
exports.makeServiceType = -> makeType.call @, 'service'
