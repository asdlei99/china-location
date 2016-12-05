require "china_location/version"
require "yaml"

module ChinaLocation
  class << self

      CURRENT_PATH = File.dirname(__FILE__)
      @@data = {}

      def search(*args)
          case args.size
          when 3
              search_with_full_params(*args)
          when 2
              search_with_prov_city(*args)
          else
              {}
          end
      end

      def search_with_prov_city(prov, city)
          init
          provs = @@data.keys
          full_prov = provs.select { |p| p.include? prov }.first
          if !full_prov.nil?
              cities = @@data[full_prov].keys
              full_city = cities.select { |c| c.include? city }.first
              is_accurate = true

              if full_city.nil?
                  full_city = cities.first
                  is_accurate = false
              end

              full_county = full_city
              result = {
                  prov: full_prov,
                  city: full_city,
                  county: full_county
              }
              result.merge! @@data[full_prov][full_city][full_county]
              result.merge!({ is_accurate: is_accurate })
              return result
          else  # 省份未匹配到
              return {}
          end
      end

      def search_with_full_params(prov, city, county)
          init
          provs = @@data.keys
          full_prov = provs.select { |p| p.include? prov }.first
          if !full_prov.nil?
              cities = @@data[full_prov].keys
              full_city = cities.select { |c| c.include? city }.first
              if !full_city.nil?
                  counties = @@data[full_prov][full_city].keys
                  full_county = counties.select { |c| c.include? county }.first
                  is_accurate = true

                  if full_county.nil?
                      full_county = full_city
                      is_accurate = false
                  end
                  result = {
                      prov: full_prov,
                      city: full_city,
                      county: full_county
                  }
                  result.merge! @@data[full_prov][full_city][full_county]
                  result.merge!({ is_accurate: is_accurate })
                  return result

              else  # 城市未匹配到
                  return {}
              end
          else  # 省份未匹配到
              return {}
          end
      end

      def init
          yml_path = CURRENT_PATH + "/china_location/yml/location.yml"
          if !File.exists?(yml_path)
              generate_yml
          end
          File.open(yml_path, 'r') { |f| @@data = YAML.load(f) }
      end

      def generate_yml
          file = File.join(CURRENT_PATH, '/china_location/origin_files', 'location.txt')
          data = IO.readlines(file)
          data.each do |d|
              # 河北省 唐山市 唐山市 经度118.2 纬度39.63 邮编063000
              prov, city, county, longitude, latitude, code = d.split(" ")
              @@data[prov] ||= {}
              @@data[prov][city] ||= {}
              @@data[prov][city][county] ||= {}
              @@data[prov][city][county] = {
                  longitude: longitude.gsub("经度", ""),
                  latitude: latitude.gsub("纬度", ""),
                  code: code.gsub("邮编", "")
              }
          end
          yml_dir = CURRENT_PATH + "/china_location/yml"
          Dir.mkdir(yml_dir) if !File.exists?(yml_dir)
          File.open(File.join(yml_dir + '/location.yml'), 'w+') { |f| f << @@data.to_yaml }
      end

  end
end
