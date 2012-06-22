require 'nokogiri'
require 'json'

module Raphael
  class SVG

    def initialize svg
      @filename = File.basename(svg, File.extname(svg))
      svg_data = Nokogiri::XML(File.read(svg))

      shapes = {}
      svg_data.search('g/g').each do |elem|
        shape = elem.search("path").collect {|path| path[:d].strip}.join
        shapes[elem[:id]] = shape
      end

      @shapes = {"shapes" => shapes}
    end

    def to_js
      json = JSON.pretty_generate @shapes
      "var #{@filename.downcase} = #{json}"
    end

  end
end