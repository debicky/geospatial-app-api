module PolygonGenerator
  def self.generate_polygon_around_point(central_lat, central_lon, radius, sides = 5)
    points = (1..sides).map do |i|
      angle = 2 * Math::PI * i / sides
      [
        central_lon + radius * Math.cos(angle),
        central_lat + radius * Math.sin(angle)
      ]
    end
    points << points.first

    "POLYGON((#{points.map { |point| point.join(' ') }.join(',')}))"
  end
end
