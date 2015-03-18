require 'rexml/document'

class CSVX
  VERSION = '1.0.0'

  class UnreadableFileError < StandardError; end

  def self.parse_file(path)
    if File.readable?(path)
      self.parse(File.read(path))
    else
      raise CSVX::UnreadableFileError, path
    end
  end

  def self.parse(data)
    doc = REXML::Document.new(data).root
    {
      :header => doc.elements.to_a('/csvx:document/csvx:header/csvx:value').map(&:text),
      :rows   => doc.elements.to_a('/csvx:document/csvx:row/').map { |row| row.elements.to_a('csvx:value').map(&:text) },
    }
  end

  def self.write_to_csvx(hash, file)
    document = REXML::Document.new
    root = REXML::Element.new('csvx:document')
    root.add_attribute('xmlns:csvx', 'https://github.com/rodjek/csvx/')
    document.add_element(root)
    unless hash[:header].nil?
      header = REXML::Element.new('csvx:header')
      hash[:header].each do |item|
        element = REXML::Element.new('csvx:value')
        element.text = item
        header.add_element(element)
      end
      root.add_element(header)
    end

    hash[:rows].each do |row|
      row_element = REXML::Element.new('csvx:row')
      row.each do |item|
        element = REXML::Element.new('csvx:value')
        element.text = item
        row_element.add_element(element)
      end
      root.add_element(row_element)
    end

    outfile = File.open(file, 'w')
    document.write(outfile, 2)
    outfile.write("\n")
    outfile.close
  end
end
