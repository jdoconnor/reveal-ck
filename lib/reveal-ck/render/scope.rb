module RevealCK
  module Render
    # A Scope provides methods available at render time.
    class Scope
      attr_reader :config
      include RequiredArg
      include ContentsOf
      include CssFiles
      def initialize(args)
        @dir = retrieve(:dir, args)
        @config = retrieve(:config, args)
      end

      def index_html_head
        index_head_html_erb = RevealCK.path_to('templates',
                                               'reveal.js',
                                               'index_head.html.erb')
        template = Tilt.new(index_head_html_erb)
        template.render(self)
      end
    end
  end
end
