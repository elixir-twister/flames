if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule Flames.Live.Error do
    use Flames.Web, :live_view
    @moduledoc false

    def moduleLine(error) do
      "<span>
      <h5></h5>
      <h6></h6>
    </span>"
    end

    def render(assigns) do
      ~L"""
      <div className="row">
        <div className="col-xs-12">
          <Link to="/">≪ Back</Link>
        </div>
      </div>
      <div className="row">
        <span>Last occurrence: @error.timestamp</span>
        moduleLine(@error)
        <pre>
        @error.message
        </pre>
      </div>
      """
    end

    # def render(assigns), do: Errors.render("index.html", assigns)

    def mount(_session, socket) do

      {:ok, assign(socket, errors: [])}
    end
end

end
