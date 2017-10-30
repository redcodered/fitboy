module Grape
  class Entity

    class << self
      alias_method :orig_expose, :expose
    end

    def self.expose(*args, &block)
      options = args.last.is_a?(Hash) ? args.pop : {}

      if args.size > 1
        throw new ArgumentError('Too many arguments.')
      end

      field = args.pop

      unless options[:documentation]
        ds = Nutrition::Docstring.docstring([
         self.parent.name.split('::').last.underscore,
         'fields',
         field
        ].join('.'))
        unless ds.nil?
          options[:documentation] = ds.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
        end
      end

      orig_expose field, options, &block
    end
  end
end