if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule Flames.Live.Error do
    @moduledoc false

    use Phoenix.LiveView

    def render(assigns) do
      ~L"""
      <Layout>
      <div className="row">
        <div className="col-xs-12">
          <Link to="/">≪ Back</Link>
        </div>
      </div>
      <div className="row">
        <span>Last occurance: {incidents && incidents[0] && incidents[0].timestamp || this.state.error.timestamp}</span>
        {moduleLine}
        <pre>
          message
        </pre>
      </div>
      </Layout>
      """
    end

    def mount(_session, socket) do
      {:ok, assign(socket, error: "error!")}
    end

    def handle_event("add-error", %{"q" => error}, socket) do
      case error do
        "" -> {:noreply, assign(socket, :error, "")}
        _ -> {:noreply, assign(socket, :error, error)}
      end
    end
  end
end