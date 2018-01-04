# gem to parse xml files
require 'nokogiri'

class Device

  # accesses the variable called devices
  attr_accessor :devices

  # initializes the variable
  def initialize
    @devices = Nokogiri::XML(File.open('./mini-schema.xml'))
  end

  # gets all tags with the name device
  def get_all_devices
    @devices.search("device")
  end

  # gets all the names within the xml as an array
  def get_all_names
    names = []

    get_all_devices.each do |device|
      names.push(device.element_children[0].text)
    end

    names
  end

  # gets all the notes within the xml as an array
  def get_all_notes
    notes = []

    get_all_devices.each do |note|
      notes.push(note.element_children[2].text)
    end

    notes
  end

  # combines the arrays into a two-dimensional array
  def get_notes_and_names
    a = get_all_names
    b = get_all_notes

    a.zip(b)
  end

  # returns the values with the device_name
  def find(device_name)
    get_notes_and_names.select do |name, note|
      name == device_name
    end
  end
end
