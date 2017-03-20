module Guard
  class Karma < Guard::Plugin
    class Notifier
      RUNNING_TITLE = 'Karma running...'.freeze
      FAILURE_TITLE = 'Karma failure.'.freeze
      SUCCESS_TITLE = 'Karma success.'.freeze

      attr_accessor :options

      def initialize(options = {})
        @options = options
      end

      def notify_start
        return unless options[:notification]

        Guard::Compat::UI.notify('', title: RUNNING_TITLE, image: :pending, priority: -1)
      end

      def notify(summary)
        return unless options[:notification]

        run_count, total_count, failure_count = parse_summary(summary)

        body = "Executed #{run_count} of #{total_count}"
        if failure_count > 0
          body += " with #{failure_count} failure(s)"
        end

        title = title(failure_count)
        image = image(failure_count)
        priority = priority(image)
        Guard::Compat::UI.notify(body, title: title, image: image, priority: priority)
      end

      private

      def parse_summary(summary)
        # Example:
        # Executed x of y (n FAILED) (skipped z)
        summary.match(/Executed\ (\d+)\ of\ (\d+)\ \((\d+)\ FAILED\)/) do |match|
          return [match[1].to_i, match[2].to_i, match[3].to_i]
        end

        # Example:
        # Executed x of y (skipped z) SUCCESS
        summary.match(/Executed\ (\d+)\ of\ (\d+).*\ SUCCESS/) do |match|
          return [match[1].to_i, match[2].to_i, 0]
        end

        [0, 0, 0]
      end

      def image(failure_count)
        if failure_count > 0
          :failed
        else
          :success
        end
      end

      def priority(image)
        { failed: 2, success: -1 }[image]
      end

      def title(failure_count)
        if failure_count > 0
          FAILURE_TITLE
        else
          SUCCESS_TITLE
        end
      end
    end
  end
end
