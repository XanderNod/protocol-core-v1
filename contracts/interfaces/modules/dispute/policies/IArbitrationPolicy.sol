// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.23;

/// @title Arbitration Policy Interface
interface IArbitrationPolicy {
    /// @notice Allows governance set the treasury address
    /// @dev Enforced to be only callable by the governance protocol admin
    /// @param newTreasury The new address of the treasury
    function setTreasury(address newTreasury) external;

    /// @notice Executes custom logic on raising dispute.
    /// @dev Enforced to be only callable by the DisputeModule.
    /// @param caller Address of the caller
    /// @param data The arbitrary data used to raise the dispute
    function onRaiseDispute(address caller, bytes calldata data) external;

    /// @notice Executes custom logic on disputing judgement.
    /// @dev Enforced to be only callable by the DisputeModule.
    /// @param disputeId The dispute id
    /// @param decision The decision of the dispute
    /// @param data The arbitrary data used to set the dispute judgement
    function onDisputeJudgement(uint256 disputeId, bool decision, bytes calldata data) external;

    /// @notice Executes custom logic on disputing cancel.
    /// @dev Enforced to be only callable by the DisputeModule.
    /// @param caller Address of the caller
    /// @param disputeId The dispute id
    /// @param data The arbitrary data used to cancel the dispute
    function onDisputeCancel(address caller, uint256 disputeId, bytes calldata data) external;

    /// @notice Executes custom logic on resolving dispute
    /// @dev Enforced to be only callable by the DisputeModule
    /// @param caller Address of the caller
    /// @param disputeId The dispute id
    /// @param data The arbitrary data used to resolve the dispute
    function onResolveDispute(address caller, uint256 disputeId, bytes calldata data) external;

    /// @notice Returns the treasury address
    function treasury() external view returns (address);
}
