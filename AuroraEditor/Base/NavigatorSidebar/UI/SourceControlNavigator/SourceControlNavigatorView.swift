//
//  SourceControlNavigatorView.swift
//  AuroraEditor
//
//  Created by Nanashi Li on 2022/05/20.
//

import SwiftUI

struct SourceControlNavigatorView: View {

    @ObservedObject
    private var workspace: WorkspaceDocument

    @State
    private var selectedSection: Int = 0

    init(workspace: WorkspaceDocument) {
        self.workspace = workspace
    }

    var body: some View {
        VStack {
            SegmentedControl($selectedSection,
                             options: ["Changes", "Repositories", "Actions"],
                             prominent: true)
            .frame(maxWidth: .infinity)
            .frame(height: 27)
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
            .padding(.top, 1)
            .overlay(alignment: .bottom) {
                Divider()
            }

            if selectedSection == 0 {
                ChangesView(workspace: workspace)
            }

            if selectedSection == 1 {
                RepositoriesView(workspace: workspace)
            }

            if selectedSection == 2 {
                ActionsListView(workspace: workspace)
            }
        }
    }
}
