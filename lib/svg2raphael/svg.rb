require 'nokogiri'
require 'pathname'
require 'json'

module Raphael
  class SVG

    attr_accessor :filename, :basename

    def initialize svg
      @filename = Pathname.new svg
      @basename = @filename.basename @filename.extname
      svg_data = Nokogiri::XML(@filename.read)

      shapes = {}
      svg_data.search('g/g').each do |elem|
        shape = elem.search("path").collect {|path| path[:d].strip}.join
        shapes[elem[:id]] = shape
      end

      @shapes = {"shapes" => shapes}
    end

    def to_js
      json = JSON.pretty_generate @shapes
      "var #{@basename.to_s.downcase} = #{json}"
    end

  end
end